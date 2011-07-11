From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] e_powersaver: Underclock checks
Date: Mon, 11 Jul 2011 19:25:17 -0400
Message-ID: <20110711232517.GC20367@redhat.com>
References: <1310114243.2940.3.camel@phoenix>
 <4E1B745A.5000802@interia.pl>
 <4E1B8404.1050909@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E1B8404.1050909@interia.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: Axel Lin <axel.lin@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Tue, Jul 12, 2011 at 12:15:16AM +0100, Rafa=C5=82 Bilski wrote:

Your email client word-wrapped your patch so it won't apply.
When you resend, there's a few small typos/grammar..

 > +    /* Check for systems using underclocked CPU */
 > +    if (!freq_failsafe_off && max_multiplier !=3D current_multiplie=
r) {
 > +        printk(KERN_INFO "eps: Your processor is running at
 > different then "
 > +            "its maximum frequency.\n");

"is running at a different frequency than its maximum" reads a little c=
learer.

 > +        printk(KERN_INFO "eps: Some systems use underclocked CPU's\=
n");
 > +        printk(KERN_INFO "eps: Use of \"e_powersaver\" on them may =
cause "
 > +            "irreperable damage.\n");

'irreparable'.

 > +    if (!voltage_failsafe_off && max_voltage !=3D current_voltage) =
{
 > +        printk(KERN_INFO "eps: Your processor is running at
 > different then "
 > +            "its maximum voltage.\n");

similar to above.

	Dave
