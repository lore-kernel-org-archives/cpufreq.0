From: =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Subject: Re: [PATCH] e_powersaver: Add sanity checks to code provided by VIA
Date: Thu, 14 Jul 2011 00:01:58 +0100
Message-ID: <4E1E23E6.1020706@interia.pl>
References: <1310114243.2940.3.camel@phoenix> <4E1B745A.5000802@interia.pl>
	<20110713222428.GB14071@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110713222428.GB14071@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Dave Jones <davej@redhat.com>, Axel Lin <axel.lin@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org


> On Mon, Jul 11, 2011 at 11:08:26PM +0100, Rafa=C5=82 Bilski wrote:
>   >  Patch from VIA is forcing "e_powersaver" to accept any processor
>   >  >=3DA, but code supports only A and D.
>   >  Patch from VIA is forcing "e_powersaver" to support new brand, b=
ut
>   >  code was intended for 2 bits only.
>   >  Looks like model D is using 8 bits for brand. Compensate.
>   >
>   >  Thanks to Axel Lin for pointing it out!
>   >
>   >  Signed-off-by: Rafa=C5=82 Bilski<rafalbilski@interia.pl>
>
> This, and your other patch still don't apply, because your email clie=
nt
> has converted all tabs to spaces.
>
> 	Dave
>
Sorry. I was sure in past I used Mozilla Thunderbird to send patches.
I will resend patches tomorrow. Second patch seems a bit premature now
anyway. Do you mind if I shorten message to: CPU isn't running at max
frequency (as I expected), you can use option to...?

Sorry
Rafa=C5=82


----------------------------------------------------------------
Znajdz samochod idealny dla siebie!
Szukaj >> http://linkint.pl/f29e2
