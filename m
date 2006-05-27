From: Dave Jones <davej@redhat.com>
Subject: Re: [ PATCH ] Longhaul - call suspend(PMSG_FREEZE) before and
	resume() after
Date: Sat, 27 May 2006 17:32:49 -0400
Message-ID: <20060527213249.GA5366@redhat.com>
References: <4478640A.2030001@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4478640A.2030001@interia.pl>
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
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Sat, May 27, 2006 at 04:36:58PM +0200, Rafa=C5=82 Bilski wrote:

Because of this chunk..

 > diff -uprN -X linux-2.6.16.18-vanilla/Documentation/dontdiff linux-2.6.1=
6.18-vanilla/block/genhd.c linux-2.6.16.18/block/genhd.c
 > --- linux-2.6.16.18-vanilla/block/genhd.c	2006-05-27 15:50:01.000000000 =
+0200
 > +++ linux-2.6.16.18/block/genhd.c	2006-05-27 15:53:13.000000000 +0200
 > @@ -16,9 +16,9 @@
 >  #include <linux/kobj_map.h>
 >  #include <linux/buffer_head.h>
 > =20
 > -static struct subsystem block_subsys;
 > +struct subsystem block_subsys;
 > =20
 > -static DECLARE_MUTEX(block_subsys_sem);
 > +DECLARE_MUTEX(block_subsys_sem);
 > =20
 >  /*
 >   * Can be deleted altogether. Later.
 > @@ -511,8 +511,10 @@ static struct kset_uevent_ops block_ueve
 >  };
 > =20
 >  /* declare block_subsys. */
 > -static decl_subsys(block, &ktype_block, &block_uevent_ops);
 > +decl_subsys(block, &ktype_block, &block_uevent_ops);
 > =20
 > +EXPORT_SYMBOL(block_subsys);
 > +EXPORT_SYMBOL(block_subsys_sem);
=20
This really should also get posted to linux-kernel, though I don't
think people are going to be particularly enthusiastic about exposing
these innards to modules.

		Dave

--=20
http://www.codemonkey.org.uk
