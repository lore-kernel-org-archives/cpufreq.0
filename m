From: Baeckham <baeckham@gmx.net>
Subject: governor setting seems not to be enough after hibernating
Date: Sat, 31 Mar 2007 13:00:47 +0200
Message-ID: <200703311300.48086.baeckham@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi 

It seems that setting just setting governor is not enough after hibernating.

On my laptop the governor is set to conservative, but the cpu is set to its 
max frequency. The system will continue running with max freq, it will not 
clock down the cpu. So I changed the cpufreq-set call 
in /etc/init.d/cpufrequtils to:

cpufreq-set -c ${n} -g "${2}" -d ${MINFREQ}

and configured MINFREQ in /etc/conf.d/cpufrequtils

As far as I know this would be useful for other users too - a friend has the 
same problem. So something like this should be added to the script. Of course 
it could be more flexible to make it fit for all governors without manual 
configuration.

Thanks
Steffen
