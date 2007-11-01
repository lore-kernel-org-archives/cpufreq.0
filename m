From: "Ankur Shah" <shahankur11@gmail.com>
Subject: how do I measure the time it takes to switch between frequencies?
Date: Thu, 1 Nov 2007 08:02:57 -0400
Message-ID: <b9bbbad00711010502x171c19b7y6f6d6d5ff0a182f1@mail.gmail.com>
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
To: Cpufreq@lists.linux.org.uk

Hello folks,

I am trying to evaluate the performance of parallel benchmarks at various
frequencies and was wondering how would I actually go about measuring the
time it takes to switch between 2 frequencies.
(I am guessing since rdtsc is measured based on cycles, it is kindof useless
when the frequency itself it changing)
Any ideas on how would I go about doing this?

-Ankur
