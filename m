From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Dynamic frequency governor
Date: Sat, 14 Feb 2004 18:09:16 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040214170916.GA12622@dominikbrodowski.de>
References: <Pine.LNX.4.44.0310180228350.14780-100000@cat.eecg.toronto.edu>
	<Pine.LNX.4.44.0312221635550.23136-100000@cat.eecg.toronto.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============81811813151736423=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.44.0312221635550.23136-100000@cat.eecg.toronto.edu>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: David Kar-Fai Tam <tamda@eecg.toronto.edu>
Cc: wtsang@dgp.toronto.edu, cpufreq@www.linux.org.uk, Catalin Drula <catalin@cs.toronto.edu>


--===============81811813151736423==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2003 at 04:41:40PM -0500, David Kar-Fai Tam wrote:
> On Sat, 18 Oct 2003, David Kar-Fai Tam wrote:
> > I am a graduate student working on a course project involving
> > implementing DVS algorithms on mobile devices.
> >=20
> > We (3 graduate students) are attempting to implement several DVS
> > algorithms (as described in various research papers) in Linux 2.6 using
> > the CPUFreq API. According to Dominik Brodowski, we will be attempting =
to=20
> > implement a dynamic governor for the CPUFreq API.
> > We plan to do this in the kernel.
> >=20
> > You can check out our project website at
> > http://www.eecg.toronto.edu/~tamda/csc2228/
> > You will find a proposal and a recent progress report.
>=20
> Status update:
> We have finished our DVS project.
> If interested, please check out the above website.
> There is a final report, presentation slides describing our
> accomplishments, and source code.
>=20
> We have implemented the AVGn, past, peak, and our own "future" DVS=20
> algorithms on kernel 2.6.0-test9.

First of all, many thanks and congratulations for this tremendous
accomplishment.

However -- as with (almost) all open source projects -- there is still much
room for improvements in your source code, some of which I'll adress below.
I hope you're willing to continue maintaining your CPUfreq governor(s) until
they are (possibly) merged into the Linux kernel and beyond.


1.) Source code format

The source code available on your project homepage is in a somewhat unusual
form for additions to the Linux kernel -- a compressed archive of some
files. Usually, such additions are made available in "diff" form -- for
example,

cd drivers/cpufreq/
cp cpufreq.c cpufreq.c.original
diff -up cpufreq.c.original cpufreq.c > ../../../cpufreq-2.6.3-rc2-fix-memo=
ry-leak

For details, check out Documentation/SubmittingPatches in the linux kernel
sources.

These "diffs" are easier to discuss and to apply to other kernels
(patch(1)).

Also, if you modify existing files, it's best to do this in a seperate
patch/diff. Also, if such a change is big or invasive, it's good to split it
up into several, logical pieces.


2.) structure or cpufreq_dvs.c

You have implemented four different scaling algorithms. It's good that
you put them into one file -- cpufreq_dvs.c -- as they share at least some
code. However, the sperate selection method (file dvs_algorithm) is
unnecessary and, in my opinion, bad. Each algorithm can and should be an
independent cpufreq governor, and have its independent cpufreq_governor
struct.


3.) content of cpufreq_dvs.c

I'll focus on cpufreq_dvs.c now, as I don't have the necessary insight into
the kernel scheduler to comment on these parts.

  // INCREASE means increase the speed by a number of steps
  // DECREASE is similar
  // SETSPEED means set a certain speed

SETSPEED is clear. But INCREASE and DECREASE trouble me. A cpufreq governor
needs to be generic, e.g. it needs to work on many different CPUs in many
different surroundings. You can't really tell whether there are two, four or
even thousands of possible "frequency steps". So relying on "frequency
steps" is fundamentally broken in cpufreq governors / CPU frequency=20
scaling algorithms -- you need to say "increase one step, but _at least_ 5%
of the CPU maximum frequency!"

		float util;

		/* Calculate utilization. Get a real between 0 and 1.
		 * I need the float cast because result will be 0.xxxxxxx,
		 * which would otherwise get truncated to 0 before being
		 * assigned to util.
		 */
		util =3D (float) run_jiffies /
			p->task_load_array[i].orig_time_slice;

You can't do that -- the kernel doesn't support floating point math (it's in
the Linux-kernel FAQ somewhere if you need details). As the next code line =
is

		util_int =3D util * p->task_load_array[i].speed;

you can simplify it to

		util_int =3D (p->task_load_array[i].speed * run_jiffies)
		util_int /=3D p->tark_load_array[i].orig_time_slice


4.) future

It'd be great if you could provide (several) independent "diffs", which can
then be discussed in detail on this list or elsewhere (e.g. linux-kernel fo=
r the
details on the scheduler).

	Dominik

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFALlY8Z8MDCHJbN8YRAtSsAKCdsDF2B3zNyAaYadWDlcp/FSJleQCeIWdL
mCXQ8N9hPoKXHoboWFTrLoA=
=DDn2
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--


--===============81811813151736423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============81811813151736423==--

