From: PCS <pcs@olympe.ch>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Sun, 20 Feb 2005 21:59:48 +0100
Message-ID: <200502202159.48580.pcs@olympe.ch>
References: <20050220131518.GB4495@inskipp>
	<20050220145350.GD20702@isilmar.linta.de>
	<20050220181448.GA5277@inskipp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050220181448.GA5277@inskipp>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="utf-8"
To: cpufreq@lists.linux.org.uk

Le Dimanche 20 F=C3=A9vrier 2005 19.14, Alexander Clouter a =C3=A9crit=C2=
=A0:
(snip)
> Along similar lines, I was told that initialising statics to zero *must* =
be
> done and not assumed; friends have told me its a 'gcc specific extension'.
> Last time I was told this was not necessary...

I'm really not sure it is a "gcc specific extension", re-read paragraph 6.7=
=2E8=20
from the ISO 9899:1999 norm, especially point 10. It explicitly say :

10 If an object that has automatic storage duration is not initialized
     explicitly, its value is indeterminate. If an object that has static
     storage duration is not initialized explicitly, then:
   - if it has pointer type, it is initialized to a null pointer;
   - if it has arithmetic type, it is initialized to (positive or unsigned
      zero;
   - if it is an aggregate, every member is initialized (recursively)
     according to these rules;
   - if it is a union, the =EF=AC=81rst named member is initialized (recurs=
ively)
     according to these rules.

Regards,
Pcs
