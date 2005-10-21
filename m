From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: Patch: Fix pending timer stuck condition
Date: Fri, 21 Oct 2005 16:34:05 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A8430382FDE1@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Dave Jones <davej@redhat.com>, "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

=20
> One question though, this part..
>=20
> -               if (i++ > 0x1000000) {
> +               if (i++ > 10000) {
>                         printk(KERN_ERR PFX "detected change=20
> pending stuck\n");
>                         return 1;
>=20
>=20
> means that on affected hardware, we'll see that msg a lot more
> regularly now. Was this intentional, or a leftover debugging change ?

The original huge number was dreamt up by myself after measuring=20
the worst case for the pending bit to clear, and then multiplying
by 100,000 or something equally ridiculous, to make sure it never
triggered by accident. As the hardware guarantees that the pending
bit will clear, the driver was supposed to loop for ever, but
polling for ever in a kernel driver seemed like a bad idea. The
lower value makes sense now that the condition occurs and is=20
understood.

Paul.
