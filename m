From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [RFC] cpufrequtils-0.5-rc1
Date: Tue, 17 Jan 2006 21:36:43 +0100
Message-ID: <20060117203643.GB16217@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Hi,

At
http://kernel.org/pub/linux/kernel/people/brodo/cpufrequtils-0.5-pre1.tar.bz2
you can find a new prerelease version of cpufrequtils. Most important is
that the package size was reduzed by a factor of 11, only caused by a switch
away from autotools to a customized Makefile based on the one to be found in
udev. Also, compilation speed is down by a factor of 10 or so... I'm
interested in your feedback on this, especially from package maintainers
whether this complicates their life much, or if they have any (different)
suggestions.

For configuration, please edit the "Makefile" found in the top directory.

Oh, and as the release numbering is a bit confusing -- was 0.3 really _that_
unstable? -- I think I'll switch to the versioning system known by udev (and
pcmciautils), which will mean that instead of cpufrequtils-0.5 it will be
named cpufrequtils-1.

Thanks,
	Dominik
