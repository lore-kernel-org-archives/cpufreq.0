From: Ricardo Manuel Oliveira <rmo@eurotux.com>
Subject: speedstep on Coppermine (asus M1)
Date: Mon, 15 Sep 2003 15:54:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1063637650.7398.23.camel@linus.office.eurotux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

Hi all,

 I've been following the list for a while, but found no explanation on
the strange behaviour I get with speedstep.

 Using an way old version (from 2002/08/15) and an older kernel version
(2.4.18), I am able to use speedstep perfectly. The interface is the old
one (/proc/sys/cpu/0/speed{-min,-max}).

 Upgrading to kernel 2.4.21 + cpufreq 2.4.21-2 + acpi-20030619
downgrades the feature list: speedstep does not work (although a insmod
speedstep-ich speedstep_coppermine=3D1 works) and acpi does not allow any
performance change mode.


 Is this a known issue with 2.4.21 or this particular cpufreq version?


Thanks,
 Ricardo Oliveira.

[root@bofh patch-int]# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 10
cpu MHz         : 851.943
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
cmov pat pse36 mmx fxsr sse
bogomips        : 1697.38
[root@bofh patch-int]# cat /proc/cpufreq
          minimum CPU frequency  -  maximum CPU frequency  -  policy
                                                                           =
    =20
[root@bofh patch-int]# insmod speedstep-ich speedstep_coppermine=3D1
Using /lib/modules/2.4.21-asus/kernel/arch/i386/kernel/speedstep-ich.o
                                                                           =
    =20
[root@bofh patch-int]# cat /proc/cpufreq
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       700000 kHz ( 82 %)  -     850000 kHz (100 %)  -=20
performance
                                                                           =
    =20
[root@bofh patch-int]# cat /proc/acpi/processor/CPU0/info
processor id:            0
acpi id:                 1
bus mastering control:   yes
power management:        no
throttling control:      no
performance management:  no
limit interface:         no

[root@bofh patch-int]# cat /proc/sys/cpu/0/speed*
0
0
0




--=20
Ricardo Manuel Oliveira <rmo@eurotux.com>
Eurotux Inform=E1tica, SA
