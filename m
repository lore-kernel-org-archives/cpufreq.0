From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq driver for nForce2
Date: Thu, 10 Jun 2004 11:17:18 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610091718.GA20494@dominikbrodowski.de>
References: <40BF2860.1070502@hasw.net>
	<20040606162052.GA26435@dominikbrodowski.de>
	<40C76A23.2080405@hasw.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40C76A23.2080405@hasw.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Witt <se.witt@gmx.net>
Cc: cpufreq@www.linux.org.uk

Hi Sebastian,


On Wed, Jun 09, 2004 at 09:50:59PM +0200, Sebastian Witt wrote:
> http://www.hasw.net/linux/cpufreq-nforce2-0.2.tar.bz2

Looks quite good now, just two minor issues:

nforce2_get() is missing in struct cpufreq_driver nforce2_driver

//#include <linux/slab.h>
can be removed, AFAICS.

	Dominik
