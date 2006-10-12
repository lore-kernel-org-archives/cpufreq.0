From: Carl Thompson <cet@carlthompson.net>
Subject: Testers needed for new CPUSpeed beta
Date: Thu, 12 Oct 2006 16:52:47 -0700
Message-ID: <20061012165247.m05przqmgwckgg4o@carlthompson.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain;
	charset=;
	DelSp="Yes";
	format="flowed"; charset="us-ascii"
To: CPUFreq List <cpufreq@lists.linux.org.uk>

Hello,

      I finally got around to buying a multi-core CPUFreq-capable =20
machine and I have updated CPUSpeed to properly handle multi-core CPUs =20
that tie together cores under one control interface. Users of current =20
multi-core machines should see very, VERY significant performance =20
improvements from their machines.

(CPUSpeed is a userspace daemon that monitors the processor usage on a =20
system and adjusts the processor speed and voltage to maximize battery =20
life while still allowing maximum performance when needed. CPUSpeed is =20
designed for laptop (or server) users that wish minimize power usage =20
(maximize battery life). However, everyone with a modern =20
CPUFreq-capable CPU can benefit.

Send me an email with your hardware platform, Linux kernel version and =20
OS version details to get the beta if you:
* Run an AMD AM2 4x4 platform (I really need someone with one of this)
* Run a Core Duo or Core 2 Duo
* Run an AMD X2
* Run an SMP machine (the more processors the better)
* Just want to run the beta to see if it works better / faster than whatever
   you're currently using

Of course you must be running a platform that has a working CPUFreq driver.

Thank you,
Carl Thompson
