From: Mattia Dongili <dongili@supereva.it>
Subject: cpufreqd 1.1.2 released
Date: Fri, 12 Mar 2004 10:03:09 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040312090309.GB1260@inferi.kami.home>
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

[sorry for the noise]

cpufreqd-1.1.2 has been released.

This release mainly fixes a bug in PMU plugin that made it unusable.
I received many patches including but not limited to multiple cpu support,
select which resources to poll and more! stay tuned :)

packages (clean source, other coming soon) are available at:

http://www.sourceforge.net/projects/cpufreqd

cpufreqd is meant to be a replacement of the speedstep applet you can
find on some other OS, it monitors CPU, battery level, AC state and
running programs and adjusts the frequency governor according to a set
of rules specified in the config file.

thanks
-- 
mattia
:wq!
Hodie quarto Idus Martias MMDCCLVII ab urbe condita est
