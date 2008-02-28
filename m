From: "Saru Addep" <saru.dpm@gmail.com>
Subject: sys interface for get/set clock frequencies of all clocks in the
	system...
Date: Thu, 28 Feb 2008 14:47:41 -0800
Message-ID: <9f79f7f50802281447i6af8ce5do391a9c8014aea57f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: cpufreq@lists.linux.org.uk, dynamicpower-devel@lists.sourceforge.net

Hi All,

Is there a generic sys interface to get and set various (devices) clock
frequencies of the system in the 2.6.23 distribution.

Following is a more detaild description of my question :
There is /sys/devices/system/cpu/cpu0/cpufreq directory which has files that
can be used to set processor frequency when cpufreq is enabled.

So lets say I have an i2c device, and I want to change the i2c clock
frequency. Is there a generic framework where in all clocks for the system
are present in one place, so that I can do a get/set on the clock
frequencies.

I tried searching in /sys/devices but didn't find anything.

It will be good if there is something like
/sys/devices/system/clocks/<names_of_clocks>

Thanks
Saringni.
