From: richard.brunner@amd.com
Subject: RE: powernow-k8-acpi driver
Date: Wed, 3 Mar 2004 20:00:44 -0600
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <99F2150714F93F448942F9A9F112634C0FD3862D@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pavel@suse.cz, davej@redhat.com, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, paul.devriendt@amd.com


> -----Original Message-----
> From: Pavel Machek [mailto:pavel@suse.cz] 
> 
> Hi!
> 
> >  > Dave, could you apply these? That are cleanups from Paul's new version
> >  > of driver (killed few unused defines, right names for MSR's
> >  > (hopefully!), more linux-like comments). No code changes.
> > 
> > Looks trivial enough. I just bounced it forward to Linus directly.
> > (I'm travelling this week, and bitkeeper on a laptop is unfunny)
> 
> :-)
> 
> >  > - *   (c) 2003 Advanced Micro Devices, Inc.
> >  > + *   (c) 2003, 2004 Advanced Micro Devices, Inc.
> >  >   *  Your use of this code is subject to the terms and conditions of the
> >  > - *  GNU general public license version 2. See "../../../COPYING" or
> >  > + *  GNU general public license version 2. See "../../../../../COPYING" or
> >  >   *  http://www.gnu.org/licenses/gpl.html
> >  >   */
> > 
> > This bit seems really silly though, but thats just my opinion 8-)
> > I'd just kill the ../'s completely.
> 
> Agreed, I assume AMD lawyers wanted that... If not, perhaps we can
> make it disappear?

Killing the ../'s is probably fine so long as we leave the 
"Your use ... version 2." and shrink the copying notice to 
"See COPYING or http ..."

We stopped paying our lawyers by the number of letters in 
copyright notices several months ago, so I think it is ok.


] -Rich ...
] AMD Fellow
] richard.brunner at amd com  
