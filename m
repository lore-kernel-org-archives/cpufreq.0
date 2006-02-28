From: Andi Kleen <ak@suse.de>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Tue, 28 Feb 2006 23:22:01 +0100
Message-ID: <200602282322.03316.ak@suse.de>
References: <20060222024438.GI20204@MAIL.13thfloor.at> <20060228213428.GA31044@isilmar.linta.de> <d120d5000602281339h777a9b73nb95bf6b6b5ee90c9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932525AbWB1WW2@vger.kernel.org>
In-Reply-To: <d120d5000602281339h777a9b73nb95bf6b6b5ee90c9@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dtor_core@ameritech.net
Cc: Matt Mackall <mpm@selenic.com>, Dave Jones <davej@redhat.com>, Adrian Bunk <bunk@stusta.de>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Tuesday 28 February 2006 22:39, Dmitry Torokhov wrote:
> On 2/28/06, Dominik Brodowski <linux@dominikbrodowski.net> wrote:
> > On Tue, Feb 28, 2006 at 03:26:32PM -0600, Matt Mackall wrote:
> > > > So even if the battery lasts longer, you don't have anything of it, 'cause
> > > > the CPU can even compute _less_ in this longer time-span. Remember that
> > > > idling doesn't count...
> > >
> > > Which is different from other power-saving modes how? If it means I
> > > can read my email longer on the plane, it's a power-saving mode.
> >
> > But you can't... [*]
> ...
> > [*] unless the idling algorithm is broken and does not enter C2-type idle
> > states.
> 
> Or box does not support anything but C1.

There are quite advanced forms of C1 around.
And I would expect even old style dumb C1 to save more than throttling.

-Andi
