From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: cpufreq change appears to cause ps2 mouse hangs
Date: Mon, 25 Apr 2005 14:19:32 -0500
Message-ID: <d120d500050425121934cd3bd1@mail.gmail.com>
References: <20050425190459.34415.qmail@web53603.mail.yahoo.com>
Reply-To: dtor_core@ameritech.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050425190459.34415.qmail@web53603.mail.yahoo.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Eric Oosting <eoosting@yahoo.com>
Cc: cpufreq@lists.linux.org.uk

On 4/25/05, Eric Oosting <eoosting@yahoo.com> wrote:
>=20
> My problem is that whenever powernowd changes the
> frequency on my cpu my
> mouse hangs for about a second with the following
> error to
> /var/log/messages:
>=20
> Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
> at isa0060/serio1/input0 lost synchronization,
> throwing 4 bytes away.

I don't think it is cpufreq that is to blame, but rather because (I am
speculating here) powernowd reads /proc/acpi/battery/BATX/info which
is known to take a _long_ time and mess up KBC...

Do you see the same messages if you switch frequency directly through
sysfs without powernowd involved?

--=20
Dmitry
