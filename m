From: Mattia Dongili <dongili@supereva.it>
Subject: [ANN] cpufreqd-1.1
Date: Mon, 5 Jan 2004 18:42:59 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040105174259.GD946@inferi.kami.home>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: CPUFreq Mailing List <cpufreq@www.linux.org.uk>

cpufreqd-1.1 has been released.

Over the rc1 it has a bunch of bugfixes (see ChangeLog for details). I
didn't add the possibility to select resources to poll because I'm in a
hurry to work on 1.2 which will add more features like support for the
on_demand governor.

This release adds 2 major feature like cpu monitoring and PMU support
and a workaround to avoid reading /proc/acpi/battery/*/info if your ACPI
implementation is very cpu consuming.

packages (clean source, debian-src and debian-i386) are available at:

http://www.sourceforge.net/projects/cpufreqd

cpufreqd is meant to be a replacement of the speedstep applet you can
find on some other OS, it monitors CPU, battery level, AC state and
running programs and adjusts the frequency governor according to a set
of rules specified in the config file.

thanks
-- 
mattia
:wq!
