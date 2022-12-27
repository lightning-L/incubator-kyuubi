--
-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

-- the metadata table ddl

CREATE TABLE IF NOT EXISTS metadata(
    key_id bigint PRIMARY KEY AUTO_INCREMENT COMMENT 'the auto increment key id',
    identifier varchar(36) NOT NULL COMMENT 'the identifier id, which is an UUID',
    session_type varchar(128) NOT NULL COMMENT 'the session type, SQL or BATCH',
    real_user varchar(1024) NOT NULL COMMENT 'the real user',
    user_name varchar(1024) NOT NULL COMMENT 'the user name, might be a proxy user',
    ip_address varchar(512) COMMENT 'the client ip address',
    kyuubi_instance varchar(1024) NOT NULL COMMENT 'the kyuubi instance that creates this',
    state varchar(128) NOT NULL COMMENT 'the session state',
    resource varchar(1024) COMMENT 'the main resource',
    class_name varchar(1024) COMMENT 'the main class name',
    request_name varchar(1024) COMMENT 'the request name',
    request_conf mediumtext COMMENT 'the request config map',
    request_args mediumtext COMMENT 'the request arguments',
    create_time BIGINT NOT NULL COMMENT 'the metadata create time',
    engine_type varchar(1024) NOT NULL COMMENT 'the engine type',
    cluster_manager varchar(128) COMMENT 'the engine cluster manager',
    engine_id varchar(128) COMMENT 'the engine application id',
    engine_name mediumtext COMMENT 'the engine application name',
    engine_url varchar(1024) COMMENT 'the engine tracking url',
    engine_state varchar(128) COMMENT 'the engine application state',
    engine_error mediumtext COMMENT 'the engine application diagnose',
    end_time bigint COMMENT 'the metadata end time',
    peer_instance_closed boolean default '0' COMMENT 'closed by peer kyuubi instance',
    INDEX kyuubi_instance_index(kyuubi_instance),
    UNIQUE INDEX unique_identifier_index(identifier),
    INDEX user_name_index(user_name),
    INDEX engine_type_index(engine_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
