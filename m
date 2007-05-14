From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH] Minor updates to powernow-k8
Date: Mon, 14 May 2007 16:55:32 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076DC0@SAUSEXMB1.amd.com>
References: <4648D2E1.5030802@amd.com>
 <20070514215317.GE29024@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20070514215317.GE29024@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

> On Mon, May 14, 2007 at 04:21:37PM -0500, Mark Langsdorf wrote:
>  > I've submitted the following patches before, but they don't
>  > seem to have made it into the tree yet.
>=20
> I merged something into cpufreq.git yesterday, though not
> your patch, as I couldn't find it anywhere :-/
>=20
> I only bumped as far as 0x70000 though which is what the user
> reported was necessary to make it work on his system.

0x80000 is the correct value.
=20
>  > Update the processor ID check to support newer RevF Turions
>  > and indicate number of processors and cores more cleanly
>  > in startup messages.
>=20
> I'm puzzled by AMDs naming/numbering scheme.
> How does RevF have a higher value than RevG ?

I'm not sure myself.
=20
> Also, maybe we should rename CPUID_XMOD_REV_G to CPUID_XMOD_REV_MASK
> or similar if it's going to continually bump and change revs ?

I suppose we could do that.  Historically, we've been
renaming the #define each time, but hopefully that=20
won't be necessary any more.

-Mark Langsdorf
Operating System Research Center
AMD
