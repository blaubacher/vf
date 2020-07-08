program main
  implicit real  (a-z)

  type numerics_t
    real :: dt, time, tmax
  end type

  type gas_t
    real :: c_p, MW, c_v, rgas, g
  end type

  type pyro_t
    real :: mgen, height, diameter, gas_yield, density, flame_temp, burn_rate_ref, burn_rate_exp
    real :: num_tablets, burn_dist, mdotgen, edotgen
  end type


  type chamber_t
    real volume, mgas, E, M, edot, mdot, T, P, diam
  end type
  type(numerics_t) :: aa

    namelist /num/ dt, tmax
    namelist /gas/  c_p, MW
    namelist/ chamber / volume, mgas,  T , diam 
    namelist /pyro/  mgen, height, diameter, gas_yield, density, flame_temp, burn_rate_ref, burn_rate_exp

  open(unit=10,file='volfil.inp',status='old')
  read(10,nml=num)
  read(10,nml=gas)
  read(10,nml=chamber)
  read(10,nml=pyro)
 close(unit=10)
 aa%dt=dt;aa%tmax=tmax;
 print *, aa
 call loop(aa)
 
contains
  
  subroutine loop(ns)
   !use numerics_module.f90
   type(numerics_t),intent(inout) :: ns
   integer :: i
   ns%time=0.0


   do i=1,100
     print *, ns%time, ns%dt
    ns%time=ns%time+ns%dt
   end do
 end subroutine


end program main


