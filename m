From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Minor updates to powernow-k8
Date: Mon, 14 May 2007 17:53:17 -0400
Message-ID: <20070514215317.GE29024@redhat.com>
References: <4648D2E1.5030802@amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4648D2E1.5030802@amd.com>
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
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, May 14, 2007 at 04:21:37PM -0500, Mark Langsdorf wrote:
 > I've submitted the following patches before, but they don't
 > seem to have made it into the tree yet.

I merged something into cpufreq.git yesterday, though not
your patch, as I couldn't find it anywhere :-/

I only bumped as far as 0x70000 though which is what the user
reported was necessary to make it work on his system.

 > Update the processor ID check to support newer RevF Turions
 > and indicate number of processors and cores more cleanly
 > in startup messages.

I'm puzzled by AMDs naming/numbering scheme.
How does RevF have a higher value than RevG ?

Also, maybe we should rename CPUID_XMOD_REV_G to CPUID_XMOD_REV_MASK
or similar if it's going to continually bump and change revs ?

	Dave


-- 
http://www.codemonkey.org.uk
