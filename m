From: mark newman <emergant2000@yahoo.co.uk>
Subject: Re: powernow-k7: changing of VID is posible, says tom...
Date: Sun, 3 Oct 2004 11:18:04 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041003101804.83402.qmail@web86901.mail.ukl.yahoo.com>
References: <20041003091351.90731.qmail@web86903.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041003091351.90731.qmail@web86903.mail.ukl.yahoo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk


Sorry thats x86info not cpuinfo

 --- mark newman <emergant2000@yahoo.co.uk> wrote: 
>  
> I'm no expert here, but you may find more info using
> dmesg.  Also should fsb be 100 instead of 200?  If
> you
> have /dev/cpuid support in your kernel, I think
> cpuinfo will give you the cpuid (I think so anyway)
> 
> I should say that I couldnt get this to work either,
> although others on the list certainly have :).
> 
> Mark
> 
> --- Nebojsa Trpkovic <tnt@professor.ru> wrote: 
> > Harald Milz wrote:
> > 
> > >use modprobe. powernow-k7 has some dependencies. 
> > >
> > >  
> > >
> > Same story:
> > 
> > [root@beta tnt]# modprobe powernow-k7
> mycpuid=0x6a0
> > myfsbspeed=200 
> > mymaxfid=0x00 mystartvid=0xb mynumpstates=5 
> > myfids=0x00,0x0a,0x06,0x04,0x12
> > myvids=0x0b,0x0d,0x13,0x13,0x13
> > FATAL: Error inserting powernow_k7 
> >
>
(/lib/modules/2.6.8-dynfreq/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k7.ko):
> > 
> > No such device
> > [root@beta tnt]# modprobe powernow-k7
> mycpuid=0x7a0
> > myfsbspeed=200 
> > mymaxfid=0x00 mystartvid=0xb mynumpstates=5 
> > myfids=0x00,0x0a,0x06,0x04,0x12
> > myvids=0x0b,0x0d,0x13,0x13,0x13
> > FATAL: Error inserting powernow_k7 
> >
>
(/lib/modules/2.6.8-dynfreq/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k7.ko):
> > 
> > No such device
> > 
> > I guess that my CPU can not be recognised because
> > it's modded Barton. I 
> > made it 'mobile' by connecting L5 bridge on it.
> But,
> > in Window$ 
> > everything works fine and I'm able to change
> > multiplier on the fly.
> > Maybe I just use wrong mycpuid, but I've tried
> 0x6a0
> > and 0x7a0... :(
> > 
> > Is there any way to force powernow to work without
> > checking of CPU?
> > 
> > 
> > 
> > 
> > 
> > _______________________________________________
> > Cpufreq mailing list
> > Cpufreq@www.linux.org.uk
> > http://www.linux.org.uk/mailman/listinfo/cpufreq
> >  
> 
> 
> 	
> 	
> 		
>
___________________________________________________________ALL-NEW
> Yahoo! Messenger - all new features - even more fun!
>  http://uk.messenger.yahoo.com
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>  


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com
