/* ----------------------------------------------------------------------------
    Local Variables for All Projects

      The below local variables are used in other projects, by referring to the
       `outputs` from the remote backend.

      This setup allows consistent naming, setup, etc., but comes with a
      drawback that any change here won't actually trigger the actual changes
      in other projects. It may be possible to set up CI/CD so that this file
      is being monitored.
------------------------------------------------------------------------------- */
locals {
  aws_admin_role_name = "admin"
}
output "aws_admin_role_name" {
  value = local.aws_admin_role_name
}
