From: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Tue, 28 Feb 2006 16:39:18 -0500
Message-ID: <d120d5000602281339h777a9b73nb95bf6b6b5ee90c9@mail.gmail.com>
References: <20060222024438.GI20204@MAIL.13thfloor.at>
	 <200602212220.05642.dtor_core@ameritech.net>
	 <20060223195937.GA5087@stusta.de> <20060223204110.GE6213@redhat.com>
	 <20060228194628.GP4650@waste.org> <20060228200916.GA326@redhat.com>
	 <20060228204720.GD13116@waste.org>
	 <20060228205758.GA16268@isilmar.linta.de>
	 <20060228212632.GE13116@waste.org>
	 <20060228213428.GA31044@isilmar.linta.de>
Reply-To: dtor_core@ameritech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932502AbWB1VjW@vger.kernel.org>
In-Reply-To: <20060228213428.GA31044@isilmar.linta.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>, Dave Jones <davej@redhat.com>, Adrian Bunk <bunk@stusta.de>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk, ak@suse.de

On 2/28/06, Dominik Brodowski <linux@dominikbrodowski.net> wrote:
> On Tue, Feb 28, 2006 at 03:26:32PM -0600, Matt Mackall wrote:
> > > So even if the battery lasts longer, you don't have anything of it, 'cause
> > > the CPU can even compute _less_ in this longer time-span. Remember that
> > > idling doesn't count...
> >
> > Which is different from other power-saving modes how? If it means I
> > can read my email longer on the plane, it's a power-saving mode.
>
> But you can't... [*]
...
> [*] unless the idling algorithm is broken and does not enter C2-type idle
> states.

Or box does not support anything but C1.

--
Dmitry
