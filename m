From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: CPUFREQ Governer and system usage
Date: Tue, 1 May 2007 09:56:09 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F550149A@scsmsx415.amr.corp.intel.com>
References: <722B40942079074FA7A702110760179702C815F8@NSTMC103PEX1.ubsw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Class: urn:content-classes:message
In-Reply-To: <722B40942079074FA7A702110760179702C815F8@NSTMC103PEX1.ubsw.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Christopher.Osborn@ubs.com, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Christopher.Osborn@ubs.com
>Sent: Tuesday, May 01, 2007 9:21 AM
>To: cpufreq@lists.linux.org.uk
>Subject: CPUFREQ Governer and system usage
>
>=20
>Hello,
>
>I was carrying out some tests on the ondemand governor in relation to
>latency benchmarks using LMBench.
>
>The current governors seem to only check the USR space for CPU usage in
>determining if the system clock rate should be increased. This can be
>replicated by using lmbench and the bw_pipe test. Bw_pipe will flood a
>pipe to get MAX bandwidth.=20
>
>While this might not be a problem in the real world, it may cause some
>issues with processes that require a lot of SYS space without a lot of
>userspace interaction.
>

What is the kernel version that you are using?
With current ondemand (2.6.21) I see idle time adds in idle and iowait
and all rest of CPU times
(user+sys+nice) will be counted as busy time.

>Here were the results(which are directly proportional to the=20
>CPUSPEED as
>shown through the current_speed)
>
>WITH MAXPERFORMANCE
>--------------------------
>$VAR1 =3D 'bw_pipe';
>$VAR2 =3D '1788.75';
>$VAR3 =3D 'bw_mem';
>$VAR4 =3D {
>          'fcp' =3D> '2609.97',
>          'cp' =3D> '3834.97',
>          'frd' =3D> '5351.96',
>          'rdwr' =3D> '5781.82',
>          'fwr' =3D> '4949.31',
>          'wr' =3D> '7846.35',
>          'bzero' =3D> '4885.64',
>          'rd' =3D> '7697.91',
>          'bcopy' =3D> '2642.06'
>        };
>$VAR5 =3D 'lat_proc';
>$VAR6 =3D {
>          'fork' =3D> '203.1852',
>          'exec' =3D> '217.9231'
>        };
>$VAR7 =3D 'lat_pipe';
>$VAR8 =3D '10.7427';
>
>------------------------------------------------------------
>WITH ONDEMAND
>------------------------------------------------------------
>
>$VAR1 =3D 'bw_pipe';
>$VAR2 =3D '1251.39';
>$VAR3 =3D 'bw_mem';
>$VAR4 =3D {
>          'fcp' =3D> '2621.93',
>          'cp' =3D> '3823.16',
>          'frd' =3D> '5352.27',
>          'rdwr' =3D> '5730.40',
>          'fwr' =3D> '4895.74',
>          'wr' =3D> '7826.72',
>          'bzero' =3D> '4886.47',
>          'rd' =3D> '7679.71',
>          'bcopy' =3D> '2641.58'
>        };
>$VAR5 =3D 'lat_proc';
>$VAR6 =3D {
>          'fork' =3D> '211.2593',
>          'exec' =3D> '216.2222'
>        };
>$VAR7 =3D 'lat_pipe';
>$VAR8 =3D '9.1837';
>

What does CPU utilication look like when running pipe. 1 thread or two
thread?

I guess the problem is due to the load running on two logical CPUs with
each logical CPU being idle for 50% of the time. And hence end up
running slower.


Thanks,
Venki
