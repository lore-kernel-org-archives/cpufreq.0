From: Holger Macht <hmacht@suse.de>
Subject: Re: powersaved is backwards on my machine...
Date: Tue, 3 Oct 2006 16:10:40 +0200
Message-ID: <20061003140958.GA7087@homac>
References: <E1GHkFA-000420-0x@uruk.org>
	<20061002231848.GD9748@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061002231848.GD9748@dominikbrodowski.de>
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
To: Erich Boleyn <erich@uruk.org>, cpufreq@lists.linux.org.uk

On Mon 02. Oct - 19:18:48, Dominik Brodowski wrote:
> Hi,
> 
> On Mon, Aug 28, 2006 at 09:45:48AM -0700, Erich Boleyn wrote:
> > So, I could not find any documentation on cpufreq that claimed the
> > frequency states listed should be in any particular order, but maybe
> > I was just not looking in the right place for the documentation...
> 
> There's no such documentation that I'm aware of :) and I don't see why we
> should enforce any particular order here. So I'd say fixing powernowd is the
> right approach here.

Ok, so I will fix powersaved to sort the values after reading them from
scaling_avaialable_frequencies because I can't even assume that they are
in any particular order, neither descending nor ascending.

Regards,
	Holger
