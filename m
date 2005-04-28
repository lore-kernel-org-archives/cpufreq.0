From: Dave Jones <davej@redhat.com>
Subject: Merging status.
Date: Thu, 28 Apr 2005 16:47:19 -0400
Message-ID: <20050428204719.GG8514@redhat.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

So, I've finally got around to extracting the bits that were
in the cpufreq bitkeeper tree, and exported them all as
GNU diffs for the time being.

These will go off to Linus pretty soon.

I'll set up a script to auto-mirror cpufreq changes that
I've got queued for merging. They'll appear at
http://www.codemonkey.org.uk/projects/cpufreq/pending-patches/
Treat this directory the same as you treated
"merged into cpufreq-bk".
(Ie, Andrew can just set up a wget -r on this dir for each -mm
 [theres also a http://www.codemonkey.org.uk/projects/agp/pending-patches/
 for Andrews info])

I may look into using git at a later time, but right now its
probably going to be easier to just throw patches around.

		Dave
