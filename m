From: Daniel Rubio Bonilla <danielrubiob@terra.es>
Subject: Re: How can I guess the system FSB speed?
Date: Wed, 15 Mar 2006 19:48:12 +0100
Message-ID: <200603151948.13122.danielrubiob@terra.es>
References: <200603150018.33139.danielrubiob@terra.es>
	<20060314234027.GB8659@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060314234027.GB8659@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

El Mi=E9rcoles, 15 de Marzo de 2006 00:40, escribi=F3:
> On Wed, Mar 15, 2006 at 12:18:33AM +0100, Daniel Rubio Bonilla wrote:
>  > Hi to everyone. I am new in this mailing list.
>  >
>  > I would like to ask how could I guess the speed of the FSB of the
>  > system, if there is any way...
>
> you can't reliably.  the best you can hope for is to decode the EBLCR MSR
> if present.  Unfortuantly, it has different meaning on pretty much
> every CPU out there, which makes it a bit of a mess to decode.

Thanks a lot Dave. I have found this register for Pentium 4 and other P6 in=
tel=20
processors. But it seems it has disappeared in the Pentium-M model. And is=
=20
just the one I would like to know the speed :(
Do you have any information about this processor, or do you know another wa=
y=20
of finding the FSB speed?

Thanks again :)

Daniel
