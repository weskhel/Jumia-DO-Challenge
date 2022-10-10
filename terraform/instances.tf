
resource "aws_instance" "jumia_phone_validator"{
    ami = var.ami
    instance_type = var.inst_type
    key_name = var.keyname
    vpc_security_group_ids = ["${aws_security_group.jumia-sg.id}"]
    tags = {

      Name = "jumia_phone_validator"
    }
}
resource "aws_db_instance" "jmv_db" {
    allocated_storage = 10
    max_allocated_storage = 15
    db_name = var.db_name
    engine = "postgres"
    engine_version = "13.6"
    instance_class = var.db_inst_type
    username = var.db_user
    password = var.db_pass
    skip_final_snapshot = true
    vpc_security_group_ids = ["${aws_security_group.jumia-db-sg.id}"]

    tags = {
      Name = "jmv_database"
    }
}