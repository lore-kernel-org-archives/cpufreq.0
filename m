From: Christophe Couronne <xof@altern.org>
Subject: speedstep and deep sleep on celeron-M
Date: Sat, 18 Sep 2004 10:21:49 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <414BF01D.4000905@altern.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi everybody !

I've just bought a new laptop based on a celeron-M processor (an
IBM thinkpad R51). According to intel, this family of processor doesn't
support speedstep, which is replaced by another technology called "deep
sleep". I can't find more information about it.

I would like to know if the speedstep functionnality can be enabled
anyway. The celeron-M processor seems to be based on a pentium-M banias
(same family, same model id, same stepping) and the p4-clockmod module
can be loaded (but not the speedstep-centrino). In fact, the celeron-M
seems to be just a pentium-M banias without speedstep (?) and with a=20
512Ko L2
memory cache.

When the p4-clockmod is enabled, a new /sys entry is created. below is a
listing of the directory :

brasserie:/sys/devices/system/cpu/cpu0/cpufreq# ls -l
total 0
-r--------  1 root root    0 2004-09-18 05:17 cpuinfo_cur_freq
-r--r--r--  1 root root 4096 2004-09-18 05:16 cpuinfo_max_freq
-r--r--r--  1 root root 4096 2004-09-18 05:16 cpuinfo_min_freq
-r--r--r--  1 root root 4096 2004-09-18 03:12 scaling_available_frequencies
-r--r--r--  1 root root 4096 2004-09-18 05:22 scaling_available_governors
-r--r--r--  1 root root 4096 2004-09-18 05:22 scaling_cur_freq
-r--r--r--  1 root root 4096 2004-09-18 05:22 scaling_driver
-rw-r--r--  1 root root    0 2004-09-18 03:12 scaling_governor
-rw-r--r--  1 root root 4096 2004-09-18 05:22 scaling_max_freq
-rw-r--r--  1 root root 4096 2004-09-18 05:22 scaling_min_freq

The problem is that the scaling_governor is set to "performance" and
can't be changed, so the processor always runs at his max frequency.

Is there people which have succeeded to enable power management (deep
sleep or speedstep) on a Celeron-M based laptop?=20

Thank you for any information.

Best regards.

   Christophe Couronne.

--=20
Christophe Couronne=20
xof@[phplop|calvix|altern].org

* phplop.org - yet another php tribioune !
* E =3D MC=B2 <=3D> WE =3D WMC=B2 <=3D> Le Week-end, je moule !
