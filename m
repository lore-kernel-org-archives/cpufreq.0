From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] Set min and max frequencies
Date: Sun, 20 Jul 2008 11:19:44 +0200
Message-ID: <20080720091944.GA608@isilmar.linta.de>
References: <Pine.LNX.4.64.0807181817530.16435@mustang.lysator.liu.se>
	<20080720075431.GA22597@isilmar.linta.de>
	<Pine.LNX.4.64.0807201042440.31266@mustang.lysator.liu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0807201042440.31266@mustang.lysator.liu.se>
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
To: Adam =?iso-8859-1?Q?Engstr=F6m?= <ae@lysator.liu.se>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

Hej,

On Sun, Jul 20, 2008 at 11:00:52AM +0200, Adam Engstr=F6m wrote:
> On Sun, 20 Jul 2008, Dominik Brodowski wrote:
> =

> > Hi,
> > =

> > On Fri, Jul 18, 2008 at 06:38:48PM +0200, Adam Engstr=F6m wrote:
> > > This patch fixes a bug with that the scaling min and max frequencies =
are =

> > > not set when they are not entirely correctly specified. For example =

> > > setting max frequency to 500000 when that frequency is 500040 accordi=
ng to =

> > > the frequency table.
> > =

> > but what if the CPU supports many many different frequencies (like
> > gx-suspmod) and the user wants to set the max to 5000000 instead of 501=
000 ?
> > or instead of 500500 ?
> =

> So all supported frequencies are not listed in the table in such a case? =


No, the list of available frequencies is just an optional part; these
drivers usually do not export a list of available frequencies.

> > > +	if (policy->max < data->min)
> > > +		policy->max =3D data->min;
> > =

> > if the new maximum value is smaller than the current minimum value, we =
set
> > the new maximum value to the old minimum value? Why?
> > let's assume the old policy was		300000 kHz to 500000 kHz
> > and the new policy should be		100000 kHz to 200000 kHz
> > =

> > why is this overwritten to be		100000 kHz to 300000 kHz ?
>  =

> This seems indeed incorrect. The problem I am trying to solve is if the =

> old policy is 500040 kHz to X kHz and this should be changed to 500040 kH=
z =

> to 500000 kHz then this would be stopped and the max frequency would stil=
l =

> be X kHz. The value 500000 is written due to a message written during =

> startup of supported frequencies. Then I would like this incorrect =

> frequency value to be adjusted to the nearest supported frequency.

Hm, I don't think the kernel should try to outsmart the user. The correct
place for such an improvement would be userspace, e.g. in cpufrequtils.

Best greetings to Sweden,
	Dominik
