From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: powersaved is backwards on my machine...
Date: Mon, 2 Oct 2006 19:18:48 -0400
Message-ID: <20061002231848.GD9748@dominikbrodowski.de>
References: <E1GHkFA-000420-0x@uruk.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <E1GHkFA-000420-0x@uruk.org>
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
To: Erich Boleyn <erich@uruk.org>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Mon, Aug 28, 2006 at 09:45:48AM -0700, Erich Boleyn wrote:
> So, I could not find any documentation on cpufreq that claimed the
> frequency states listed should be in any particular order, but maybe
> I was just not looking in the right place for the documentation...

There's no such documentation that I'm aware of :) and I don't see why we
should enforce any particular order here. So I'd say fixing powernowd is the
right approach here.

Thanks for debugging this!

	Dominik
