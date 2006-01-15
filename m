From: Andrey Borzenkov <arvidjaar@mail.ru>
Subject: Re: cannot unload acpi-cpufreq
Date: Sun, 15 Jan 2006 21:17:31 +0300
Message-ID: <200601152117.32333.arvidjaar@mail.ru>
References: <200601150118.57542.arvidjaar@mail.ru>
	<20060114222510.GA1112@isilmar.linta.de>
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060114222510.GA1112@isilmar.linta.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sunday 15 January 2006 01:25, Dominik Brodowski wrote:
>
> > I do not see, how can I actually "release" it. Also, the reason I need to
> > unload it - I am testing alternative CPU frequency driver and would like
> > to avoid reboot when switching. This driver unloads just fine (it is
> > written by me and contains the minimal set of functions).
>
> What is this for a driver?
>

I have Toshiba Portege 4000. It supports only acpi-cpufreq providing 2 
performance states. All Toshiba also can scale CPU speed (I am not sure if it 
really changes *frequency*) using HCI interface that offers 8 levels. I was 
interested to see if using apparently more deep slowdown may be of any 
improvement; also my son has Tecra 3490CT, and this is not supported by any 
cpufreq driver so it could be of use for such systems.

Unfortunately naive approach proved useless. Using CPU slowdown alone does not 
result in any noticeable improvements w.r.t. current CPU temp; actually it is 
worse than using ACPI even when setting the most slow speed.

I will post prototype driver if there is any interest.

regards

- -andrey
> For additional cpufreq-related messages, please consider posting to the
> cpufreq mailing list:  cpufreq  (AT) lists (DOT) linux.org (DOT) uk
>
> 	Dominik
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDypG8R6LMutpd94wRAsgrAJ0cUrfVV8ZU+MqwwZX6ENFfdFzjzACgk9MB
1gFML2ByKBU7gFi6IUNAWXQ=
=yq+7
-----END PGP SIGNATURE-----
