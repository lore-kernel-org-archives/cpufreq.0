From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: cpufreq and modular build
Date: Sun, 11 May 2008 12:18:18 -0400
Message-ID: <20080511161818.GG15445@codemonkey.org.uk>
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
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@lists.linux.org.uk, Goran <gkoruga@siol.net>

On Tue, May 06, 2008 at 05:12:43PM +0200, Thomas Renninger wrote:
 >
 > On Mon, 2008-05-05 at 17:58 +0200, Goran wrote:
 > >           To compile this driver as a module, choose M here: the
 > >           module will be called cpufreq.
 >
 > This should just be cut out. Could you send a patch?

We fixed this back in November!
Commit 232e8884cb62f865d69383e42ef333215da504d4

        Dave
