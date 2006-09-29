From: Ryan Underwood <nemesis@icequake.net>
Subject: transition latency
Date: Thu, 28 Sep 2006 19:32:47 -0500
Message-ID: <20060929003247.GA20765@dbz.icequake.net>
Reply-To: nemesis@icequake.net
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk


What's the purpose of the transition_latency field with respect to the
cpufreq infrastructure?  Should I be setting this to:
* the time it takes for my set_cpu_state function to execute and return
* the latency between the call to set_cpu_state and the actual CPU speed
change
* the time it takes for the hardware to respond to MY request (inside
set_cpu_state function) to change speeds

Just a little confused.  Here the problem is that my set_cpu_state
function could take up to 35ms to execute, but the actual frequency
transition ( a component of that function) happens within 7ms.  10ms is
the ondemand/conservative governors' upper limit for transition latency,
so if I take the whole function into account, those governors reject my
driver.

-- 
Ryan Underwood, <nemesis@icequake.net>
