From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq-nforce2 divider
Date: Sun, 4 Jun 2006 19:42:49 -0400
Message-ID: <20060604234249.GB2823@redhat.com>
References: <44831B78.6050407@hasw.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44831B78.6050407@hasw.net>
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
To: Sebastian Witt <hasw@hasw.net>
Cc: cpufreq@lists.linux.org.uk

On Sun, Jun 04, 2006 at 07:42:16PM +0200, Sebastian Witt wrote:
 > Patch against 2.6.16. Sets minimum PLL divider to 2. No negative impact 
 > when tested with two nForce2 based boards

Ok, but for the sake of the changelog, can you explain why
this is a good thing ?

		Dave

-- 
http://www.codemonkey.org.uk
