From: =?iso-8859-1?q?Michael_Teichgr=E4ber?= <mt@wmipf.in-berlin.de>
Subject: /proc/sys/cpu interface and elanfreq on linux 2.4.20
Date: Wed, 17 Sep 2003 02:10:49 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <87znh4e0l2.fsf@wmipf.in-berlin.de>
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

Hello,

I applied a cpufreq patch (http://www.codemonkey.org.uk/projects\
/cpufreq/cpufreq-2.4.21-2.gz) to a linux 2.4.20 tree without any
problems, and compiled with the following (default) settings for an
AMD Elan cpu:

    CONFIG_CPU_FREQ=3Dy
    CONFIG_CPU_FREQ_TABLE=3Dy
    CONFIG_CPU_FREQ_PROC_INTF=3Dy
    CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
    CONFIG_CPU_FREQ_24_API=3Dy
    CONFIG_ELAN_CPUFREQ=3Dm


The just created module `elanfreq.o' has been loaded smoothly into the
kernel, and in /proc/cpufreq I can see

          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0         1000 kHz (  1 %)  -      66000 kHz (100 %)  - performance


But I wonder about why both /proc/sys/cpu/0/speed-min and -max contain
zero, and `speed' always shows the maximum frequency. If I echo a
value out of the list in elanfreq.c into `speed', there is no
reaction, elanfreq_target() will not be called (with one exception:
When initializing, the value specified by `max_freq' will be set
twice via elanfreq_target).

Am I missing something, does perhaps "deprecated interfaces" mean, the
userspace access via /proc/sys/cpu might not work?


--=20
Michael Teichgr=E4ber
