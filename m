From: Mattia Dongili <dongili@supereva.it>
Subject: [ANN] Cpufreqd 1.2.0 released
Date: Sun, 22 Aug 2004 21:11:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040822191146.GB1927@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: CPUFreq Mailing List <cpufreq@www.linux.org.uk>

cpufreqd-1.2.0 has been released.

This release focuses on some add-ons such as support for multiple
processors, translation between percentage and absolute values for 2.6
kernels and some major bug-fixes: ACPI support is extended to desktop PCs
where neither a battery nor an ac_adapter is available (I'm running it
successfully at home to keep my P4 a little cooler)

packages (clean source, other coming soon) are available at:

http://www.sourceforge.net/projects/cpufreqd

cpufreqd is meant to be a replacement of the speedstep applet you can
find on some other OS, it monitors CPU, battery level, AC state and
running programs and adjusts the frequency governor according to a set
of rules specified in the config file.

thanks and sorry for the noise
-- 
mattia
:wq!
