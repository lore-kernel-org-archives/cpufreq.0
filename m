From: Suihong Liang <s2liang@hopper.math.uwaterloo.ca>
Subject: gettimeofday() malfunctions when called frequently
Date: Mon, 16 Aug 2004 16:21:43 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.GSO.4.58.0408161551170.17523@hopper.math.uwaterloo.ca>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

I think either cpufreq or the 2.4 kernel has a bug. When consecutive calls
to gettimeofday() are very frequent, say 20ms, I found that 10% chance
that gettimeofday() returned SMALLER value than in the previous call,
which should not happen.

The problem exists in (x86): cpufreq of 20040816 on kernel 2.4.27, and
cpufreq of 20040705 on kernel 2.4.26.

I've also tried kernel 2.6.7, gettimeofday() worked well.

regards.
suihong
