From: Carl Thompson <cet@carlthompson.net>
Subject: Re: Shell script to select the right cpufreq module?
Date: Wed, 31 Mar 2004 20:52:56 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040331205256.y2gjkw0404swwk84@carlthompson.net>
References: <4069CA25.2080806@free.fr>
	<20040330203109.GA7141@dominikbrodowski.de>
	<20040331073455.q797owk8kwogcccw@carlthompson.net>
	<20040331154400.GA32308@dominikbrodowski.de>
	<20040331155938.GF25834@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040331155938.GF25834@redhat.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: Carl Thompson <cet@carlthompson.net>, cpufreq mailing list <cpufreq@www.linux.org.uk>

Well, if the module name is supposed to be "speedstep-ich.ko" then I'm
not seeing it installed anywhere...

Thanks,
Carl

Quoting Dave Jones <davej@redhat.com>:

> On Wed, Mar 31, 2004 at 05:44:00PM +0200, Dominik Brodowski wrote:
>
>  > > Fedora Core 2 does not seem to even include the
>  > > speedstep-ich driver.
>  > OOOOPS. Dave?
>
> A grep shows..
> CONFIG_X86_SPEEDSTEP_ICH=y
>
> 		Dave
