From: =?ISO-8859-1?Q?G=FCnther_Abwerzger?=
 <abwerzge@teleconsult-austria.at>
Subject: Cpufreqd and kernel 2.6.2 problem
Date: Thu, 25 Mar 2004 08:46:09 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40628E41.6080806@teleconsult-austria.at>
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

Hi,

I've updated the Kernel my SuSE 9.0 running on an ASUS M2400N notebook=20
to kernel version 2.6.2
I could also manage to install all required modules to make cpufreqd=20
work. But it does not work properly - it makes no automatic adjustment=20
of the processor speed. "rccpufreqd high" brings it to maximum speed,=20
and "rccpufreqd low" brings it to minimum speed.

The only thing that helps is to enter "cpufreqd -d" as root. Then it=20
works as expected.

Did I make something wrong? Or is there a way to automatically start=20
cpufreqd with the d-option during boot?

Best regards,
Gunther



--=20
--------------------- www.teleconsult-austria.at ----------------------
G=FCnther Abwerzger
TeleConsult Austria GmbH
Schwarzbauerweg 3, A-8043 Graz, Austria
Tel. +43-316-381015-10, Fax +43-316-381015-55
Email: abwerzge@teleconsult-austria.at
