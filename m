From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] e_powersaver: Add sanity checks to code provided by VIA
Date: Wed, 13 Jul 2011 18:24:28 -0400
Message-ID: <20110713222428.GB14071@redhat.com>
References: <1310114243.2940.3.camel@phoenix>
 <4E1B745A.5000802@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E1B745A.5000802@interia.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: Axel Lin <axel.lin@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Mon, Jul 11, 2011 at 11:08:26PM +0100, Rafa=C5=82 Bilski wrote:
 > Patch from VIA is forcing "e_powersaver" to accept any processor
 > >=3DA, but code supports only A and D.
 > Patch from VIA is forcing "e_powersaver" to support new brand, but
 > code was intended for 2 bits only.
 > Looks like model D is using 8 bits for brand. Compensate.
 >=20
 > Thanks to Axel Lin for pointing it out!
 >=20
 > Signed-off-by: Rafa=C5=82 Bilski <rafalbilski@interia.pl>

This, and your other patch still don't apply, because your email client
has converted all tabs to spaces.

	Dave
