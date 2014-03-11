From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2] cpufreq: Reformat printk() statements
Date: Tue, 11 Mar 2014 20:51:33 +0100
Message-ID: <1452420.WyeUVX7CeH@vostro.rjw.lan>
References: <1394557380-15054-1-git-send-email-soren.brinkmann@xilinx.com> <16243824.d7jua8nUso@vostro.rjw.lan> <531F60B8.4020007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <531F60B8.4020007@gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, Viresh Kumar <viresh.kumar@linaro.org>, Joe Perches <joe@perches.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org

On Tuesday, March 11, 2014 12:15:04 PM Dirk Brandewie wrote:
> On 03/11/2014 12:29 PM, Rafael J. Wysocki wrote:
> > On Tuesday, March 11, 2014 10:13:00 AM Dirk Brandewie wrote:
> >> On 03/11/2014 10:03 AM, Soren Brinkmann wrote:
> >>> From: Joe Perches <joe@perches.com>
> >>>
> >>>    - Add missing newlines
> >>>    - Coalesce format fragments
> >>>    - Convert printks to pr_<level>
> >>>    - Align arguments
> >>>
> >>
> >> This introduces a bunch of lines over 80 charaters long.
> >
> > Do you mean code lines or output lines?
> 
> Code lines.

That doesn't really matter so long as they are not outrageously long. :-)

Rafael

