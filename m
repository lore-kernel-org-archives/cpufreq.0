From: Mattia Dongili <dongili@supereva.it>
Subject: [ANN] cpufreqd 1.1.1 released
Date: Sun, 8 Feb 2004 15:38:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040208143852.GE10125@inferi.kami.home>
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

cpufreqd-1.1.1 has been released.

This release mainly fixes a stupid bug in /proc/cpufreq writes handling
failing to really switch frequency if values where given in absolute
values. So if you'r using the old cpufreq interface you'd better
upgrade.

packages (clean source, debian-src and debian-i386) are available at:

http://www.sourceforge.net/projects/cpufreqd

thanks and sorry for the noise
-- 
mattia
:wq!
ante diem VI Idius Februarias MMDCCLVII ab Urbe Condita
