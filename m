From: "Lei Yang" <lei.d.yang@gmail.com>
Subject: How ondemand governor works for two-core system?
Date: Tue, 1 Apr 2008 23:25:17 -0500
Message-ID: <4e4bd25a0804012125n7ddc3042wb3719954f0fe3500@mail.gmail.com>
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
To: cpufreq@lists.linux.org.uk

Hi list,

I have a question about the ondemand governor in general. For single
processor system, it controls the frequency according to the current
CPU load and certain thresholds. Then, for a dual core system (where
the frequency of the two cores must be changed at the same time, i.e.,
you can't decrease the frequency of one core and make the other stay
at the original frequency. I think the Intel core-2-duo CPU operates
like this. Correct me if I'm wrong.), how does the ondemand governor
decide the frequency? Let's say if the CPU load of one core is higher
than the threshold, say 80%, then both core would stay at high
frequency? In other words, does the governor always evaluate the "max"
CPU load of the two cores, and decide the appropriate frequency?

I'm new to the list so I'd appreciate any comments from you! Thanks in advance!

Lei
