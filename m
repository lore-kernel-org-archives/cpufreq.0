From: Thomas Renninger <trenn@suse.de>
Subject: Re: Fehler bei cpufreq-info
Date: Tue, 02 Apr 2013 10:42:30 +0200
Message-ID: <3485704.XfQbseOPt4@skinner.arch.suse.de>
References: <51558EDC.2040503@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51558EDC.2040503@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Rainer Maier <RaMaier@gmx.de>
Cc: cpufreq@vger.kernel.org

Hi,

On Friday, March 29, 2013 01:53:48 PM Rainer Maier wrote:
> cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
cpufrequtils is outdated.
Please use cpupower which is the successor.

> Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
> analysiere CPU 0:
>    Treiber: p4-clockmod
P4-clockmod is evil and does not save much/any power.
If you have trouble with it (lagging applications/performance), best
blacklist p4-clockmod driver.

       Thomas
