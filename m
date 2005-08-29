From: Tim Weippert <weiti@security.tds.de>
Subject: Re: Bad page state on AMD Opteron Dual System with kernel
	2.6.13-rc6-git13
Date: Mon, 29 Aug 2005 12:28:31 +0200
Message-ID: <20050829102830.GA7604@pbkg4>
References: <20050826165342.GA11796@pbkg4> <43110363.7020808@gentoo.org>
	<20050829052454.GA8172@pbkg4>
Reply-To: Tim Weippert <weiti@security.tds.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050829052454.GA8172@pbkg4>
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
Content-Type: text/plain; charset="iso-8859-1"
Cc: akpm@osdl.org, davej@codemonkey.org.uk, discuss@x86-64.org, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, Daniel Drake <dsd@gentoo.org>


Hi,=20

On Mon, Aug 29, 2005 at 07:24:54AM +0200, Tim Weippert wrote:
> On Sun, Aug 28, 2005 at 01:20:51AM +0100, Daniel Drake wrote:

> >=20
> > Seems to be an identical problem as was filed here:
> >=20
> > 	http://bugs.gentoo.org/show_bug.cgi?id=3D103497
> >=20
> > This bug report seems to suggest that the ondemand scaling governor m=
ay be=20
> > at fault. Does your setup use this too?
> >=20
> > (CC'ing some extra people to make sure problem is known)
> >=20
>=20
> As this is an Server, i don't even use cpufreq on this machine. So it
> think this isn't the same problem ...

Update, with stable 2.6.13. I get nearly the same behavior.=20

One new oops:

swap_free: Bad swap file entry c000007fffff802f
swap_free: Bad swap file entry c800007fffff802f
swap_free: Bad swap file entry d000007fffff802f
swap_free: Bad swap file entry d800007fffff802f
swap_free: Bad swap file entry e000007fffff802f
swap_free: Bad swap file entry 4000000000000000
----------- [cut here ] --------- [please bite here ] ---------
Kernel BUG at "mm/rmap.c":493
invalid operand: 0000 [1] SMP=20
CPU 1=20
Modules linked in: autofs4 floppy i2c_amd756 i2c_core hw_random ohci_hcd
tg3 tsdev evdev evbug psmouse genrtc unix
Pid: 9014, comm: sh Not tainted 2.6.13
RIP: 0010:[<ffffffff8016e9ab>] <ffffffff8016e9ab>{page_remove_rmap+43}
RSP: 0018:ffff8100481c3da0  EFLAGS: 00010286
RAX: 00000000ffffffff RBX: ffff81004a5fc420 RCX: ffff81000000d000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8100011a69c8
RBP: 0000000000484000 R08: 0000000000000001 R09: 000000000000000f
R10: 0000000000000001 R11: 0000000000000000 R12: 00000000078bfbff
R13: ffff810040e133e0 R14: ffff8100011a69c8 R15: 0000000000000000
FS:  00000000457ff970(0000) GS:ffffffff8056f880(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 00002aaaaaabd000 CR3: 0000000048205000 CR4: 00000000000006e0
Process sh (pid: 9014, threadinfo ffff8100481c2000, task
ffff810048e7e270)
Stack: ffffffff801663f4 0000000000497000 ffff81004937f010
0000000000497000=20
       0000000000497000 0000000000496fff ffff8100497dd000
0000000000497000=20
       ffffffff801666ab 0000000000000000=20
Call Trace:<ffffffff801663f4>{zap_pte_range+436}
<ffffffff801666ab>{unmap_page_range+507}
       <ffffffff80166815>{unmap_vmas+293}
<ffffffff8016c4d2>{exit_mmap+162}
       <ffffffff801318b1>{mmput+49} <ffffffff80136d3a>{do_exit+442}
       <ffffffff801370c0>{sys_exit_group+0}
<ffffffff8010db7a>{system_call+126}
      =20

Code: 0f 0b a3 b4 5b 3f 80 ff ff ff ff c2 ed 01 66 66 66 90 66 66=20
RIP <ffffffff8016e9ab>{page_remove_rmap+43} RSP <ffff8100481c3da0>
 <1>Fixing recursive fault but reboot is needed!


With this i get an hanging [sh] process which can't be killed, only
cleanable with reboot:

www-data  7701  0.0  0.3 74448 6452 ?        S    11:56   0:00
/usr/sbin/cactid 0 93
www-data  7721  0.0  0.5 56296 10504 ?       S    11:56   0:00  \_
/usr/bin/php /usr/share/cacti/site/script_server.php cactid 0
www-data  9014  0.0  0.0     0    0 ?        D    11:56   0:00  \_ [sh]


The machine is an cacti system with generally high load ... seems the
kernel does only have problems on higher load.

HTH,=20

    weiti

--=20

Interpunktion und Orthographie dieser Email ist frei erfunden.
Eine =DCbereinstimmung mit aktuellen oder ehemaligen Regeln
w=E4re rein zuf=E4llig und ist nicht beabsichtigt.

Tim Weippert <weiti@topf-sicret.org>
http://www.topf-sicret.org/
