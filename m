From: Mattia Dongili <dongili@supereva.it>
Subject: [ANNOUNCE] cpufreqd-1.1-rc1 released
Date: Sun, 26 Oct 2003 17:57:19 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031026165719.GF871@inferi.kami.home>
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

cpufreqd-1.1-rc1 has been released.

This release adds 2 major feature like cpu monitoring and PMU support,
plus a bunch of fixes and a workaround to avoid reading
/proc/acpi/battery/*/info if your ACPI implementation is very cpu
consuming.

packages (clean source, debian-src and debian-i386) are available at:

http://www.sourceforge.net/projects/cpufreqd

cpufreqd is meant to be a replacement of the speedstep applet you can
find on some other OS, it monitors CPU, battery level, AC state and
running programs and adjusts the frequency governor according to a set
of rules specified in the config file.

The only enhancement I'll add before 1.1 is a paremeter to select which
resources to poll.
  
thanks (and sorry for the noise)
-- 
mattia
:wq!
