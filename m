From: Frank Mehnert <fm3@os.inf.tu-dresden.de>
Subject: Re: speedstep-piix4 don't work
Date: Fri, 11 Jul 2003 17:11:09 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307111711.14429.fm3@os.inf.tu-dresden.de>
References: <3F0AED86.7040500@theorem.ca> <3F0BB1A5.7040606@theorem.ca> <20030709100834.GP7796@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_SOtD/Og1Qf/Lsaj";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030709100834.GP7796@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: cpufreq@www.linux.org.uk


--Boundary-02=_SOtD/Og1Qf/Lsaj
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Wednesday 09 July 2003 12:08, Ducrot Bruno wrote:
> Ok.  Could you remove the lines:
>     145         /* We may have to define a 'good' throttling duty ? */
>     146         pcntrl &=3D ~(0x7 << 1);
>     147         pcntrl |=3D (0x3 << 1);
>     148
>
> That will done exactly the same stuff as the old independant kernel modul=
e.
> If that still do not work, well I will be a little puzzled then, but give
> me still dmesg in any case.

I'm a different user than the original one which opened this thread.

I'm using a Thinkpad T20 with P3 Coppermine 750 MHz with Linux 2.4.21-ac4
and the latest CPUFREQ patch including your last fixes for 2.4.21-ac4.

I've enabled SPEEDSTEP_DEBUG in speedstep-piix4.c and speedstep-lib.c
and I've added some lines for debugging output. When I load the
speedstep-piix4 module I get the following output:

(speedstep-detect says that gpo_hilo bit is 0)

  cpufreq: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x47480020, 0x0
  cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x6b560000
  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x47480020 0x0
  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x47480020 0x0
  freq_old =3D 750000
  cntb before: 0x000030e1
  cntb after:  0x000037e1
  pcntrl before: 0x00003200
  pcntrl after:  0x00001a00
  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
  freqs.new =3D 600000
              ^^^^^^
    This is speedstep_get_processor_frequency(speedstep_processor);
    called in function speedstep_set_state() immediatly after

      /* cleanup southbridge */
      pci_write_config_dword(speedstep_chipset_dev, 0x48, cntb_save);

      /* enable IRQs */
      local_irq_restore(flags);

     So the first transition from 750 MHz to 600 MHz seems to work
     correctly.

  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
  cpufreq: change to 0 MHz succeded
  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
  freq_old =3D 600000
  cntb before: 0x000030e1
  cntb after:  0x000037e1
  pcntrl before: 0x00003200
  pcntrl after:  0x00001a00
  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
  freqs.new =3D 600000
              ^^^^^^
      But the second transition fails.

  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
  cpufreq: change failed
  speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
  low_speed =3D high_speed =3D 600000

Any ideas? I still had no success with CPUFREQ on this T20 since
I'm not using Linux 2.5. =20


=46rank
=2D-=20
## Dept. of Computer Science, Dresden University of Technology, Germany ##
## http://os.inf.tu-dresden.de/~fm3                                     ##

--Boundary-02=_SOtD/Og1Qf/Lsaj
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/DtOS6z8pigLf3EcRAorJAKCLTbVbb2Jl21kb+UhtWNeEUuMbGwCfUYWV
rhSoyBOhMfiXOYzlQeR//kY=
=AT6W
-----END PGP SIGNATURE-----

--Boundary-02=_SOtD/Og1Qf/Lsaj--
