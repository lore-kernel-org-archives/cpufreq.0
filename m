From: Dominik Brodowski <linux@brodo.de>
Subject: cpufreq CVS [Was: Re: cpufreq and P-IIIM]
Date: Mon, 18 Aug 2003 20:21:37 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030818182137.GA2296@brodo.de>
References: <m2ptj5fiuc.fsf@tnuctip.rychter.com> <20030818112943.GD18032@poupinou.org> <m2vfsux5ju.fsf@tnuctip.rychter.com> <20030818190710.C1737@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030818190710.C1737@flint.arm.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Rychter <jan@rychter.com>, Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

On Mon, Aug 18, 2003 at 07:07:10PM +0100, Russell King wrote:
> On Mon, Aug 18, 2003 at 10:02:29AM -0700, Jan Rychter wrote:
> >  Ducrot> That version is way too old anyway.
> >=20
> > Huh? That was the latest 2.4 snapshot that I was able to pull from
> > ftp.linux.org.uk: cpufreq-LINUX_2_4-20030816.tar.bz2.
> >=20
> > If these are not the 'official' archives and the snapshots are outdat=
ed,
> > I'd humbly suggest pulling them off the net, because it confuses
> > people.
>=20
> As far as I'm concerned (as being the guy running the CVS and FTP
> archive) they remain official until the cpufreq maintainers explicitly
> tell me otherwise.
>=20
> Maintainers need to either check their changes into the CVS tree or
> tell me that they no longer wish to use CVS, or tell me that they
> want a 2.4-ac branch, or whatever.

AFAICS,=20
a) the 2.6. branch development is done in Dave's BK tree.=20
b) 2.4-new [=3D=3D backport of 2.6. to 2.4.] was never done in CVS,
c) 2.4-ac tags exist, but because of b) are not kept up to date,
d) depending on the outcome of the ARM and cpufreq-2.4. issue,
   2.4-stable [which is CVS LINUX_2_4] is going to be deprecated soon.

Also, it is my impression that an external CVS tree is used far less if a
feature is merged into a mainline kernel. If it's not in the kernel, keep=
ing
track of a project without something like CVS is impossible. So I'm reall=
y
glad about having had cpufreq-CVS and FTP-archives available. But, for th=
e
future, I don't see such a strong reason for keeping it.

Just my =A40.02
	Dominik
