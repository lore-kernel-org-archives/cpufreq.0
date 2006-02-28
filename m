From: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Tue, 28 Feb 2006 15:19:13 -0500
Message-ID: <d120d5000602281219v40d57d5ftdb3ab7bc95d0063c@mail.gmail.com>
References: <20060214152218.GI10701@stusta.de>
	 <20060222024438.GI20204@MAIL.13thfloor.at>
	 <20060222031001.GC4661@stusta.de>
	 <200602212220.05642.dtor_core@ameritech.net>
	 <20060223195937.GA5087@stusta.de> <20060223204110.GE6213@redhat.com>
	 <20060228194628.GP4650@waste.org> <20060228200916.GA326@redhat.com>
Reply-To: dtor_core@ameritech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932552AbWB1UTP@vger.kernel.org>
In-Reply-To: <20060228200916.GA326@redhat.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>, Matt Mackall <mpm@selenic.com>, Adrian Bunk <bunk@stusta.de>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk, ak@suse.de

On 2/28/06, Dave Jones <davej@redhat.com> wrote:
> On Tue, Feb 28, 2006 at 01:46:29PM -0600, Matt Mackall wrote:
>  >
>  > This is perplexing. Less heat equals less power usage according to the
>  > laws of thermodynamics.
>
> you end up taking longer to do the same amount of work, so you
> end up using the same overall power.
>

I'd say that energy usage is the same _per unit of work_. But if you
compare a box that is sitting idle 90% of the time at 0% throttling
vs. a box that is sitting idle 80% of the time with 50% throttling and
neither of these boxes support C2 you'll find that the second box uses
less energy overall.

--
Dmitry
