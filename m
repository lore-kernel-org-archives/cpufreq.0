From: Pavel Machek <pavel@ucw.cz>
Subject: Re: powernow-k8 updates
Date: Fri, 26 Mar 2004 13:32:16 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040326123216.GB321@elf.ucw.cz>
References: <20040326120151.GA3102@elf.ucw.cz>
	<20040326121915.GA207@elf.ucw.cz>
	<20040326122742.GA8871@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040326122742.GA8871@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: paul.devriendt@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>

On P=E1 26-03-04 13:27:42, Dominik Brodowski wrote:
> On Fri, Mar 26, 2004 at 01:19:15PM +0100, Pavel Machek wrote:
> > Hi!
> >=20
> > > Few updates, enable ACPI, add common printing function, fix typo, m=
ove
> > > "pst out of sequence" where it belongs, fix formating in
> > > powernow-k8.h. I'm not quite sure what this is against, so this is
> > > "eyes only".
> >=20
> > Its strange, ACPI code does not seem to mention batps at all, still
> > cpu goes to 800MHz when I unplug the cord... Perhaps it should at
> > least say something into the syslog?
>=20
> ... again our differences about verbosity... :-)

Actually, I do not understand how it works. How does cpufreq know how
many states are there on battery? It does something, but I'd like to
understand it...
								Pavel
--=20
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
