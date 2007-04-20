From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Voltage tweaking in powernow_k8
Date: Fri, 20 Apr 2007 13:35:23 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076D28@SAUSEXMB1.amd.com>
References: <20070415171810.GA3096@thing.nowhere>
	<1449F58C868D8D4E9C72945771150BDF02076D07@SAUSEXMB1.amd.com>
	<46239583.67d3ffa6.271c.2ed5@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <46239583.67d3ffa6.271c.2ed5@mx.google.com>
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
To: Roberto Gordo Saez <roberto.gordo@gmail.com>, cpufreq@lists.linux.org.uk

=20

> -----Original Message-----
> From: Roberto Gordo Saez [mailto:roberto.gordo@gmail.com]=20
> Sent: Monday, April 16, 2007 10:26 AM
> To: Langsdorf, Mark; cpufreq@lists.linux.org.uk
> Subject: Re: Voltage tweaking in powernow_k8
>=20
> On Mon, Apr 16, 2007 at 08:55:38AM -0500, Langsdorf, Mark wrote:
> > AMD policy is that the ACPI values must be used.  I
> > can't support a patch that overrides the ACPI values.
> >=20
> > I have no objection to it being in the code, but I
> > can't support it.
>=20
> Hi, thanks for replying.
>=20
> I understand your position about this. Please, correct me if I'm
> giving a wrong interpretation to your message; in the way I read it,
> you are unable to support those changes (because of your position at
> AMD you are required to strictly follow the policy), but you could
> live with those changes provided that your name is not attached to
> them...

Correct.

Also, if I make changes to the driver for future processors, or
to fix bugs, I won't make any great effort to fix bugs in this
code or to make sure my code supports this code.  And I will not
do bug fixes on this code.

> It may be a good idea to print warnings when the parameter is used,
> to clearly state the unsupported and potentally dangerous effect of
> the parameter (though it would not be enough to change your view,
> I guess...).

I still wouldn't be able to support it, no.  That's out of my
hands.

-Mark Langsdorf
Operating System Research Center
AMD
