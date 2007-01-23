From: Paul Beam <pbeam@comcast.net>
Subject: Geode LX support
Date: Tue, 23 Jan 2007 10:12:49 -0500
Message-ID: <45B625F1.6000500@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Has anyone looked into cpufreq support for the AMD LX800?  It provides 
control over the CPU PLL via MSR 4C000014h, but it has this ominous 
statement in the datasheet:

       When using this register to change the PLL frequencies, the 
CHIP_RESET bit should be set.

 From viewing the other AMD cpufreq drivers, it appears they do not 
require a chip reset.  This sounds like a bad thing, since I don't have 
a clue how to save the cpu state, reset, and restore the cpu state.  Is 
this a big deal?

Thanks,

Paul
